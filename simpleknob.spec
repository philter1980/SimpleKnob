Name:       simpleknob
Summary:    A simple Sailfish OS knob controller app
Version:    1.0.0
Release:    1
License:    GPLv3+
Group:      Applications/Multimedia
URL:        https://github.com/philter1980/SimpleKnob
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  pkgconfig(Qt5Multimedia)
BuildRequires:  qt5-qttools

%description
SimpleKnob is a Sailfish OS application that provides a simple knob interface,
built using QML and C++. It demonstrates multimedia interaction and UI control
using QtQuick and QtMultimedia.

%prep
%setup -q

%build
%qmake5
%make_build

%install
rm -rf %{buildroot}
%make_install

%files
%defattr(-,root,root,-)
/usr/share/applications/*.desktop
/usr/share/icons/hicolor/*/apps/*.png
/usr/share/%{name}
/usr/bin/*

%changelog
* Tue Apr 23 2024 Philter1980 <philter1980@example.com> - 1.0.0-1
- Initial release of SimpleKnob
