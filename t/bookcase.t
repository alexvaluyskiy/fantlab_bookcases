use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('FantlabBookcases');

$t->get_ok('/v1/bookcases')->status_is(200);
$t->get_ok('/v1/bookcases/5')->status_is(200);
$t->post_ok('/v1/bookcases' => json => { name => 'n', user_id => 5 })->status_is(201);
$t->put_ok('/v1/bookcases/5' => json => { bookcase_id => 3, name => 'n', user_id => 5 })->status_is(200);
$t->delete_ok('/v1/bookcases/5')->status_is(204);

done_testing();
