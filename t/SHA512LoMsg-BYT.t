use strict;
use FileHandle;
use Crypt::SHAVS;
use Digest::SHA qw(sha512);

my ($vectors, $check) = ("vec$$.tmp", "chk$$.tmp");
END { 1 while unlink ($vectors, $check) }

my $numtests = 0;
my $fh = FileHandle->new($vectors, "w");
while (<DATA>) { print $fh $_; $numtests++ if /^MD\s*=/ }  close($fh);

$fh = FileHandle->new($check, "w+");
my $stdout = select($fh);
Crypt::SHAVS->new(\&sha512)->check($vectors);
select($stdout);

my $testnum = 1;
print "1..$numtests\n";
$fh->seek(0, 0);
while (<$fh>) {
	print "not " unless /OK\s*$/;
	print "ok ", $testnum++, "\n";
}
close($fh);

__DATA__
#  CAVS 11.0
#  "SHA-512 LongMsg" information 
#  SHA-512 tests are configured for BYTE oriented implementations
#  Generated on Tue Mar 15 08:23:50 2011

[L = 64]

Len = 1816
Msg = 4f05600950664d5190a2ebc29c9edb89c20079a4d3e6bc3b27d75e34e2fa3d02768502bd69790078598d5fcf3d6779bfed1284bbe5ad72fb456015181d9587d6e864c940564eaafb4f2fead4346ea09b6877d9340f6b82eb1515880872213da3ad88feba9f4f13817a71d6f90a1a17c43a15c038d988b5b29edffe2d6a062813cedbe852cde302b3e33b696846d2a8e36bd680efcc6cd3f9e9a4c1ae8cac10cc5244d131677140399176ed46700019a004a163806f7fa467fc4e17b4617bbd7641aaff7ff56396ba8c08a8be100b33a20b5daf134a2aefa5e1c3496770dcf6baa4f7bb
MD = a9db490c708cc72548d78635aa7da79bb253f945d710e5cb677a474efc7c65a2aab45bc7ca1113c8ce0f3c32e1399de9c459535e8816521ab714b2a6cd200525

Len = 2608
Msg = d5e378ae9fc2648f4a13bbec4b0935afb4f822f5fe0d5063053d2fbd547b33b4a32e7a009ee2afafe83d2ebd603568e4a38189b5d24d59e8953260f15f654ed4f42f9a39299d68c3eb78b09e83779d5718b433f1765d35350eac46493d194e84d1ce1f81c95b59725cab8ab73d369ab01e7967cf73a3acf1789227ee75fdfb6e40f353ff0484486542be053115db2896bab86c774f8985c4dbcc4c078f7b1c3a4c867cdc6580fe44a598673494cc0fb1f6598b1295768a584041fdbd14fa7b90fa6fe33f71b743b68e23f8e7407217aad9440cc8cad28152aedb82388be2de165496d051b292de6303460273a43508296b6237c07804335d2e81229f7c9a0e7761e38a3aaf7799f40fe9cb00457ea9d5b59953232676681fc71b261a6f8cd359293f5b21f0cf3a11b7f49cb5adb3c357bed2aa185d8fe8408192d6d3ed1ff465b590892efe03
MD = a70c75b9b1f0ac2ed2c2797763ac9a6601d95f46889b00fc3ddae4d0ac6923750a108d79eb764e77ac07b7cb5c01cb4b3747dcf69ba3b35c51fb995da2632e70

Len = 3400
Msg = 4f7a5618870945b89f194e31b1aa802c5350326dc691df58708e34b48ce666b021d7c92330a69f1832412d8ac224156c9679dfedb383d9f9e13c21035d3d0002cfdf79b97ba0223cbbc833b0ad4cdd5229f2ddbbf6b650623d6cc9623da8a17d41db8e61cfbe772b23f4872adceb81e5f403535ff5f2ed996a67535994edf12a5f1230a494c946ed500e5280b5c8a82ddff369611afe58a85272e870cbd59a1012ce8509338a368b2c5dbb3ba2adfb33d30c494acca43896dbd8b030482841374055b81812c6f00c9e2bebe2096021feb69418a272aa356cefdfd22074ae91a8d2f1ef599a481c788dbe0afd54aac39672d401ef76d9f83175d177c9b72e2f6ab1e7525533d761d8e3603f14ea538904ed142abb3ff929ed55f4c6b17a72c685c3820b93463a67338756b2b033231a4f119cbb8d35d270a97791e8622340fc02f2093f9b393ad79161eb8c5897e21f7fc4b3ddeec02b736cc3ef04641c6179e825c319f6769f59fa5966f5957e573f9df0a2b76548cedd3e2158433dcb9de63f44f9be2b63319477570e14ee504b23b07cb2737a358154277912cd779abbeb1036f459c26ab7310f43
MD = 713d5c26de17e1440a36aab93f7cd8111cd62fd8bea5099b2b6bf93e470e1eaeab8b925c646e9e67ce01b03b33d2b500b9400e59f0ecdfb00dd7ddcd230cc837

Len = 4192
Msg = 5e0e84419c02ddda289aa126bdb40a060464aa58b88bad2708ab5f1e3df9ee439cb470e28eb627c6fe4904af033b6b01bf3536ba8748fca643c993d6185fd34e455a9dfe4b461cf451c04bcfc689b87748d9870bc5f6b91be004af18961fe90821a7147e1cdb44cae9aa7e6d50c579d068f9a535bbbc6deda506b9cbfd62b8daf744dc4b499d26b18dada371e7183773e73d991eb1c39f845b74bcd9964fc72a91d8fd4b1ab34a120771c4c2d4aa78ca8d4c6ab0ee32d748caf9bd29a90f9e61b50c8068d74638531d9fe84a5fa2c73c22cf20d1bc329ea1b93bc6a37ec9c5e82c886c89c77d79de98df18f0cf29a9316d6dc46b61eb7af7f1e2de2f5ca6c525bef3c996338194193fd85b9c6e66a81137cf5d652684f6b23b970eb58dce248232f6a0766379116edc33b93682824b45489cf3a75326973a5d025d1d57686d665238f8139f8e794435973aa754a41a33687d8f1930f8e7f71fcad34f039c2539e462d9542fe8520214ade7d52cf59e445f1a37a305236d524b977834d894d662b11b4b215aae27123f1dc7a9529d5ee0f41af62d19ceb1b1a71355b22075074b810c57626a097ddb7e8ee20b0dc3e370f126d19fb5223c7dfde471b2216a415b1cdc04ffa520dec59ba941e4a68fb35a1ce5d2e12147951f13b2d41d25980bfa49345be1541cd1385c15eb1a652a58083d0000dba56444fdb12687d9722aed90d2bc62eebe24df9c8b7ae897
MD = d4a3b38f18b048e61686c2159c666469ce9a9400632fd40ac1d6ed33162b921b95ac26238af9fa00a4314a6046e1733fd4fadc6033f3ac33d2b8c202afa5f02f
