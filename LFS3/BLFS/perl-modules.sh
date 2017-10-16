set -eo nounset

cd /sources

cat > /dev/null << "HEREFILE"
for k in \
https://www.cpan.org/authors/id/M/MW/MWX/Data-Uniqid-0.12.tar.gz \
http://www.linuxfromscratch.org/patches/blfs/svn/Data-Uniqid-0.12-disable_failing_test-1.patch ; do
test -f `basename $k` || \
wget --no-check-certificate \
	$k
done

rm -rf Data-Uniqid-0.12
tar xf Data-Uniqid-0.12.tar.gz
pushd  Data-Uniqid-0.12

patch -Np1 -i ../Data-Uniqid-0.12-disable_failing_test-1.patch

perl Makefile.PL &&
make &&
make test

#PERL_USE_UNSAFE_INC=1 &&
#make install

make install UNINST=1

popd
rm -rf Data-Uniqid-0.12
HEREFILE




cat << "EOF" | grep -v ^# | sed 's/^/install /' | cpan
   Sub::Identify
  SUPER
 Test::MockModule
Archive::Zip
autovivification
 Mojolicious
 Business::ISBN::Data
Business::ISBN
 Tie::Cycle
Business:ISMN
Business::ISSN
Capture::Tiny
Class::Accessor
  Number::Compare
  Text::Glob
 File::Find::Rule
Data::Compare
Data::Dump
Data::Uniqid
  Test::Deep
 CPAN::Meta::Check
     Test::Requires
    Package::Stash::XS
    Dist::CheckConflicts
   Package::Stash
  namespace::clean
  Sub::Identify
   Variable::Magic
   Sub::Exporter::Progressive
   Module::Implementation
  B::Hooks::EndOfScope
 namespace::autoclean
  Devel::StackTrace
  Eval::Closure
  MRO::Compat
  Role::Tiny
  Test::Needs
   Test::Fatal
  Sub::Quote
 Specio
   Class::Data::Inheritable
  Exception::Class
    Importer
    Test::Simple
    Sub::Info
    Term::Table
   Test2::Suite
  Test2::Plugin::NoWarnings
  Test::Without::Module
 Params::ValidationCompiler
    ExtUtils::Config
    ExtUtils::Helpers
    ExtUtils::InstallPaths
    Module::Build
   Module::Build::Tiny
  File::ShareDir::Install
  Scalar::List::Utils
   Class::Inspector
  File::ShareDir
   Class::Tiny
   File::Copy::Recursive
   Path::Tiny
   Scope::Guard
   Test::Fatal
  Test::File::ShareDir
  Test::Warnings
 DateTime::Locale
  Class::Singleton
  Try::Tiny
 DateTime::TimeZone
DateTime
DateTime::Calendar::Julian
   Module::Build
 Class::Factory::Util
   Params::Util
   Sub::Install
   Sub::Name
  Package::DeprecationManager
 DateTime::Format::Strptime
 Params::Validate
DateTime::Format::Builder
Encode::EUCJPASCII
Encode::HanExtra
Encode::JIS2K
Error
 Module::Build
 File::Which
 IPC::System::Simple
File::BaseDir
File::Slurp
File::Which
 HTML::Tagset
 libwww-perl
HTML::Parser
IPC::Run3
 Encode::Locale
  URI
  HTML::Parser
  HTTP::Message
  HTTP::Date
  IO::HTML
  LWP::MediaTypes
  Try::Tiny
 HTML::Form
 HTTP::Cookies
 HTTP::Negotiate
 Net::HTTP
 WWW::RobotRules
 HTTP::Daemon
 File::Listing
 Test::RequiresInternet
 Test::Fatal
libwww-perl
Lingua::Translit
   Test::LeakTrace
  List::SomeUtils::XS
  Module::Implementation
 List::SomeUtils
 List::UtilsBy
 Number::Compare
 Scalar::List::Utils
 Test::Warnings
 Text::Glob
List::AllUtils
 XSLoader
 Exporter::Tiny
List::MoreUtils
Log::Log4perl
 OpenSSL
 libwww-perl
  net::SSLeay
 IO::Socket::SSL
 Mozilla::CA
LWP::Protocol::https
Module::Build
 Module::Runtime
 Try::Tiny
 Test::Fatal
 Test::Requires
Module::Implementation
 Module::Build
Module::Runtime
 Digest::HMAC
  Socket6
 IO::Socket::INET6
 IO
Net::DNS
Parse::Yapp
Regexp::Common
Scalar::List::Utils
SGMLSpm
Sort::Key
Sub::Identify
Test::Command
  Algorithm::Diff
 Text::Diff
 Capture::Tiny
Test::Differences
 Try::Tiny
Test::Fatal
Test::Needs
Test::Requires
Test::Warnings
  Capture::Tiny
 Config::AutoConf
  Module::Build
 ExtUtils-LibBuilder
Text::BibTeX
 Text::CSV_XS
Text::CSV
Text::Roman
Try::Tiny
Unicode::Collate
 MIME::Charset
 Wget
Unicode::LineBreak
 Test::NEEDS
URI
 XML::SAX
 libxml2
XML::LibXML
 XML::LibXML
 File::Slurp::Tiny
XML::LibXML::Simple
 libxslt
#XML::LibXSLT
 libxml2
 XML::NamespaceSupport
 XML::SAX::Base
XML::SAX
 XML::SAX
 XML::SAX::Expat
# XML::LibXML
 Tie::IxHash
XML::Simple
XML::Writer
Data::Uniqid
EOF
