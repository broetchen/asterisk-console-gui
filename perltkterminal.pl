#!/usr/bin/perl
use strict;
use Tk;

my $frameasterisk;
my $number="";
my $mw = MainWindow->new( -bg => 'white' );
my $lala;
$mw->geometry('400x320' . '+100+100');


sub answer(){
    system("asterisk -rx \"console answer\"");
}
sub hangup(){
    system("asterisk -rx \"console hangup\"");
}
sub dial(){
  my $dialoutcontext='outgoing';
  my $dialcmd=$number."@".$dialoutcontext;
    system("asterisk -rx \"console dial $dialcmd\"");
}



my $frame1 = $mw->Frame(
    -height => 100,
    -bg     => 'black',
    )->pack( -fill => 'both', -side => 'top' );

my $other = $frame1->Frame(-bg=>'red')->grid( -row => 3, -column => 3 );
$other->Button( -text => "1", -command => sub{$number.="1"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 0, -column => 0 );
$other->Button( -text => "2", -command => sub{$number.="2"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 0, -column => 1 );
$other->Button( -text => "3", -command => sub{$number.="3"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 0, -column => 2 );
$other->Button( -text => "4", -command => sub{$number.="4"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 1, -column => 0 );
$other->Button( -text => "5", -command => sub{$number.="5"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 1, -column => 1 );
$other->Button( -text => "6", -command => sub{$number.="6"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 1, -column => 2 );
$other->Button( -text => "7", -command => sub{$number.="7"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 2, -column => 0 );
$other->Button( -text => "8", -command => sub{$number.="8"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 2, -column => 1 );
$other->Button( -text => "9", -command => sub{$number.="9"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 2, -column => 2 );
$other->Button( -text => "0", -command => sub{$number.="0"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 0, -column => 3 );
$other->Button( -text => "+", -command => sub{$number.="+"; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 1, -column => 3 );
$other->Button( -text => "C", -command => sub{chop $number; $lala->configure(-text=>"$number"); $mw->update(); })->grid( -row => 2, -column => 3 );

$other->Button( -text => "answer", -command => \&answer)->grid( -row => 0, -column => 4 );
$other->Button( -text => "dial", -command =>  \&dial)->grid( -row => 1, -column => 4 );
$other->Button( -text => "hangup", -command => \&dial)->grid( -row => 2, -column => 4 );

my $framenumber = $mw->Frame(
	-height => 20,
	-bg     => 'white',
)->pack( -fill => 'both', -side => 'top' );

$lala = $framenumber->Label(
	-text => "Nuemmerchen: $number",
);


$frameasterisk = $mw->Frame(
    -container => 1,
    -bg        => 'black',
    -relief    => 'sunken',
    -bd        => 2,
)->pack( -fill => 'both', -side => 'top' );

my $id = sprintf hex $frameasterisk->id;
my $t = $mw->Toplevel( -use => $id );
system("xterm -into $id -e \"asterisk -rvvvvvvvvv \" &");

$lala->grid( -row => 0, -column => 0, );

MainLoop();

