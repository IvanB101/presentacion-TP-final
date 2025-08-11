$recorder = 1;

$pdf_mode = 4; # using lualatex
$postscript_mode = $dvi_mode = 0;

$bibtex_use = 2;
$pdf_update_method = 0;

$clean_ext = "log pdf loe bbl nav out snm vrb nlo ptc synctex.gz run.xml";

$out_dir = "build";
$aux_dir = "build";

add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
$clean_ext .= " acr acn alg glo gls glg";

sub makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    my @args = ( "-q", "-d", $path, $base_name );
    if ($silent) { unshift @args, "-q"; }
    return system "makeglossaries", "-d", $path, $base_name; 
}

#errorstop mode (the default), TeX stops at each error and asks for user intervention. 
#batchmode it prints nothing on the terminal, errors are scrolled as if the user hit <return> at #every error, and missing files cause the job to abort. 
#nonstopmode, diagnostic message appear on the terminal but as in batch mode there is no user interaction. 
#scrollmode, TeX only stops for missing files or keyboard input.

$pdflatex='xelatex -synctex=1 -interaction=nonstopmode --shell-escape -halt-on-error %O %S';
# $pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode --shell-escape -halt-on-error %O %S';
# $pdflatex = 'pdflatex %O %S';
