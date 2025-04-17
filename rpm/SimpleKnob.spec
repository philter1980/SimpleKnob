Name:       SimpleKnob

Summary:    SimpleKnob
Version:    0.1
Release:    1
License:    LICENSE
BuildArch:  noarch
URL:        http://example.org/
Source0:    %{name}-%{version}.tar.bz2
Requires:   sailfishsilica-qt5 >= 0.10.9
Requires:   libsailfishapp-launcher
BuildRequires:  pkgconfig(sailfishapp) >= 1.0.3
BuildRequires:  pkgconfig(Qt5Core)
BuildRequires:  pkgconfig(Qt5Qml)
BuildRequires:  pkgconfig(Qt5Quick)
BuildRequires:  desktop-file-utils

%description
A simple customizable knob to link to wathever you want 


%prep
%setup -q -n %{name}-%{version}

%build

%qmake5 

%make_build


%install
%qmake5_install


desktop-file-install --delete-original         --dir %{buildroot}%{_datadir}/applications                %{buildroot}%{_datadir}/applications/*.desktop

%files
%defattr(-,root,root,-)
%defattr(0644,root,root,-)
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
Name:           harbour-SimpleKnob
Version:        1.0
Release:        1
Summary:        Simple Knob Dialer
Group:          Qt
License:        GPL-3.0
Source0:        %{name}-%{version}.tar.gz
BuildArch:      armv7hl
BuildRequires:  qt5-qtbase-devel qt5-qtmultimedia-devel

%description
A simple knob dialer for Sailfish OS.

%prep
# Preparazione del codice sorgente
%setup -q

%build
# Compilazione del codice
qmake
make

%install
# Installazione dell'app
make INSTALL_ROOT=%{buildroot} install

# Crea il file JSON vuoto se non esiste
mkdir -p %{buildroot}/home/defaultuser/.local/share/harbour-SimpleKnob
touch %{buildroot}/home/defaultuser/.local/share/harbour-SimpleKnob/dialers.json

%files
# Aggiungi i file da includere nell'RPM
%{_bindir}/harbour-SimpleKnob
%{_datadir}/applications/harbour-SimpleKnob.desktop
%{_datadir}/icons/hicolor/*/apps/harbour-SimpleKnob.png
%{_localstatedir}/lib/harbour-SimpleKnob
%{_localstatedir}/share/harbour-SimpleKnob

%changelog
* Wed Apr 16 2025 Your Name <your.email@example.com> - 1.0-1
- Initial release
