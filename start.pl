#!/usr/bin/perl

use 5.010;
use strict;
use warnings;

use XML::LibXML;


my $list;
my $add;
my $item;
my $listB;

print "Do you want to see your shopping list? (Y/N)";
$list = <>;
chomp($list);

if ($list eq 'y' || $list eq 'Y') {
    my $filename = 'menu.xml';

    my $dom = XML::LibXML->load_xml(location => $filename);

    foreach my $title ($dom->findnodes('/list/name')) {
        say $title->to_literal();
    }

    print "Do you want to add an item to your shopping list? (Y/N)";
    $add = <>;
    chomp($add);
    
    if ($add eq 'y' || $add eq 'Y') {
        print "Please type in the name of your item: ";
        $item = <>;
        chomp($item);

        my $parser = XML::LibXML->new;
        my $doc = $parser->parse_file("menu.xml");
        my $root = $doc->getDocumentElement();
        
        my $new_element= $doc->createElement("name");
        $new_element->appendText($item);
        
        $root->appendChild($new_element);
        
        $doc->toFile('menu.xml');
        
        print "You added $item to your list, would you like to see your list again? (Y/N)";
        $listB = <>;
        chomp($listB);
        
        while ($listB eq 'y' || $listB eq 'Y') {
        if ($listB eq 'y' || $listB eq 'Y') {
            
            my $filename = 'menu.xml';
            
            my $dom = XML::LibXML->load_xml(location => $filename);
            
            foreach my $title ($dom->findnodes('/list/name')) {
                say $title->to_literal();
            }
            
            print "Do you want to add an item to your shopping list? (Y/N)";
            $add = <>;
            chomp($add);
            
            if ($add eq 'y' || $add eq 'Y') {
                print "Please type in the name of your item: ";
                $item = <>;
                chomp($item);
                
                my $parser = XML::LibXML->new;
                my $doc = $parser->parse_file("menu.xml");
                my $root = $doc->getDocumentElement();
                
                my $new_element= $doc->createElement("name");
                $new_element->appendText($item);
                
                $root->appendChild($new_element);
                
                $doc->toFile('menu.xml');
                
                
                
                print "You added $item to your list, would you like to see your list again? (Y/N)";
                $listB = <>;
                chomp($listB);
            
            } else {
                last;
            print "okay, good bye\n\n";
            }} else {
            print "okay, good bye\n\n";
            }
        }
    } else {
        print "okay, good bye\n\n";
    }
    
} else {
    print "okay, good bye\n\n";
}
