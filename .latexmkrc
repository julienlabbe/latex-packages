# latexmk configuration

## viewers
$dvi_previewer = 'start xdvi -watchfile 1.5';
$ps_previewer  = 'start gv --watch';
$pdf_previewer = 'start evince';

## commande lualatex
$lualatex='lualatex -file-line-error -interaction nonstopmode %O %P';

## options
$new_viewer_always=1;
$clean_ext="glo hd mst tcbtemp listing";

## glossary
add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
sub makeglo2gls {
    system("makeindex -s gglo.ist -o '$_[0]'.gls '$_[0]'.glo");
}

## output color
use Term::ANSIColor;
$color = 'magenta';
print color($color);

{
    no warnings 'redefine';
    sub Run_msg {
        # Same as Run, but give message about my running
        print color('reset');
        warn_running( "Running '$_[0]'" );
        my ($pid, $exitcode) = Run($_[0]);
        print color($color);
        return ($pid, $exitcode);
    } #END Run_msg

}
