####
#
# show the difference between two or more files
# containing the output of the command: 'dpkg -l'
# ex:
#   python dpkgdiff.py --comparisons 2x3 1x3 -- \
#     nees_debian6_dpkg.out \
#     nees_debian7_dpkg.out \
#     hubzero_debian7_dpkg.out \
#     nanohub_debian7_dpkg.out | less
#
####

import argparse
import re

def parse_dpkg_data(data):

    d = dict()

    pattern = '([uirph])([nicufhwt])(.)\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)\s+([^\n]+)\s*'

    for result in re.finditer(pattern,data):
        (desired,status,err,name,version,arch,description) = result.groups()
        d[name] = {
            'desired'  : desired,
            'status'   : status,
            'err'      : err,
            'version'  : version,
            'arch'     : arch,
            'desc'     : description,
        }

    return d


def compare(d1,d2):

    s1 = set(d1.keys())
    s2 = set(d2.keys())
    I = s1 & s2
    AmB = s1 - s2
    BmA = s2 - s1
    return (I,AmB,BmA)


def interpret(I,AmB,BmA,clopts,x,y):

    result = ''

    if clopts.show_forward_diff:
        result += '\n===== Packages in {} that are not in {}: =====\n'\
                    .format(clopts.infile[x],clopts.infile[y])
        for name in sorted(AmB):
            desc    = data[x][name]['desc']
            desired = data[x][name]['desired']
            status  = data[x][name]['status']
            result += '\n{}{} {: <40} {}'.format(desired,status,name,desc)
        result +='\n'

    if clopts.show_backward_diff:
        result += '\n===== Packages in {} that are not in {}: =====\n'\
                    .format(clopts.infile[y],clopts.infile[x])
        for name in sorted(BmA):
            desc    = data[y][name]['desc']
            desired = data[y][name]['desired']
            status  = data[y][name]['status']
            result += '\n{}{} {: <40} {}'.format(desired,status,name,desc)
        result +='\n'

    if clopts.show_intersection:
        result += '\n===== Packages in {} and {} with different status/version: =====\n'\
                    .format(clopts.infile[x],clopts.infile[y])
        for name in sorted(I):
            f1s = '{}{}'.format(data[x][name]['desired'],data[x][name]['status'])
            f1v = '{}'.format(data[x][name]['version'])
            f2s = '{}{}'.format(data[y][name]['desired'],data[y][name]['status'])
            f2v = '{}'.format(data[y][name]['version'])
            if (f1v != f2v) or (f1s != f2s):
                result += '\n{: <25} {:3} {:15} {:3} {:15}'.format(name,f1s,f1v,f2s,f2v)
        result +='\n'

    return result


def parse_arguments():

    desc = """Show the differences between 'dpkg -l' commands.
              This program accepts files, containing the output
              of a 'dpkg -l' command, as inputs."""

    epilog = """Example:
                python %(prog)s --comparisons 0x1 2x3 -- \
                    machine1_debian6_dpkg.out \
                    machine1_debian7_dpkg.out \
                    machine2_debian7_dpkg.out \
                    machine3_debian7_dpkg.out | less"""

    parser = argparse.ArgumentParser(description=desc,epilog=epilog)

    parser.add_argument(
        '--comparisons',
        help='show comparisons between the following numbered file pairs (ie. 0x1 0x3)',
        action='store',
        dest='comparisons',
        nargs='*',
        default=[])

    parser.add_argument(
        '--show-forward-diff',
        help='show packages in file1 that are not in file2',
        action='store_true',
        dest='show_forward_diff',
        default=False)

    parser.add_argument(
        '--show-backward-diff',
        help='show packages in file2 that are not in file1',
        action='store_true',
        dest='show_backward_diff',
        default=False)

    parser.add_argument(
        '--show-intersection',
        help='show packages that are in both files with different version or status',
        action='store_true',
        dest='show_intersection',
        default=False)

    # parser.add_argument('infile', nargs=argparse.REMAINDER)
    parser.add_argument(
        'infile',
        help='file containing output from the command \'dpkg -l\'',
        nargs='+',
        action='store')

    args = parser.parse_args()

    # evaluate args

    # allow the use of '--' to denote the end of flagged arguments
    while '--' in args.infile:
        args.infile.remove('--')

    if (args.show_forward_diff
        or args.show_backward_diff
        or args.show_intersection) is False:

        args.show_forward_diff = True
        args.show_backward_diff = True
        args.show_intersection = True

    return args


if __name__ == '__main__':

    clopts = parse_arguments()

    data = list()

    for f in clopts.infile:
        print "processing {}".format(f)
        with open(f,'r') as fid:
            data.append(parse_dpkg_data(fid.read()))


    result = ''

    # generate the list of comparisons to perform
    comparisons = []
    if len(clopts.comparisons) == 0:
        # no comparisons provided, compare all
        for x in range(0,len(data)):
            for y in range(x+1,len(data)):
                comparisons.append((x,y))
    else:
        # parse the provided comparison strings
        for c in clopts.comparisons:
            match = re.match('(\d+)x(\d+)',c)
            if match is None:
                raise Exception((
                    'invalid comparison: {}, must match ixj,'
                    + ' where i and j are integers').format(c))
            (x,y) = match.groups()
            x = int(x)
            y = int(y)
            if x >= len(data):
                raise IndexError(
                    'comparison index: {} is outside of valid range: 0-{}'\
                        .format(x,len(data)))
            if y >= len(data):
                raise IndexError(
                    'comparison index: {} is outside of valid range: 0-{}'\
                        .format(y,len(data)))
            comparisons.append((x,y))

    for (x,y) in comparisons:
        (I,AmB,BmA) = compare(data[x],data[y])
        result += interpret(I,AmB,BmA,clopts,x,y)

    print result
