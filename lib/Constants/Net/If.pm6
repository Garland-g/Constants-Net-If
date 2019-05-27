use v6.c;

=begin pod

=head1 NAME

Constants::Net::If - Constants found in net/if.h

=head1 SYNOPSIS

=begin code :lang<perl6>

use Constants::Net::If;

=end code

=head1 DESCRIPTION

Constants::Net::If contains many enumerated values that are implemented as
#define directives in <net/if.h> file on unix-like operating systems.

This module should be compatible with windows, macos, linux, netbsd,
freebsd, openbsd, and dragonflybsd. Each platform will receive a
slightly different enumerations.

Based on C headers found on official sites and unofficial mirrors of source trees.

=head1 AUTHOR

Travis Gibson <TGib.Travis@protonmail.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2019 Travis Gibson

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

constant IFF is export(:IFF) := $*KERNEL.name eq 'linux' ?? do {
  my enum IFF (
    UP => 0x1,
    BROADCAST => 0x2,
    DEBUG => 0x4,
    LOOPBACK => 0x8,
    POINTTOPOINT => 0x10,
    NOTRAILERS => 0x20,
    RUNNING => 0x40,
    NOARP => 0x80,
    PROMISC => 0x100,
    ALLMULTI => 0x200,
    MASTER => 0x400,
    SLAVE => 0x800,
    MULTICAST => 0x1_000,
    PORTSEL => 0x2_000,
    AUTOMEDIA => 0x4_000,
    DYNAMIC => 0x8_000,
    LOWER_UP => 0x10_000,
    DORMANT => 0x20_000,
    ECHO => 0x40_000,
  );
  IFF;
}
!! ($*KERNEL.name eq any('netbsd') ?? do { #windows, #netbsd
  my enum IFF (
    UP => 0x1,
    BROADCAST => 0x2,
    DEBUG => 0x4,
    LOOPBACK => 0x8,
    POINTTOPOINT => 0x10,
    RUNNING => 0x40,
    NOARP => 0x80,
    PROMISC => 0x100,
    ALLMULTI => 0x200,
    OACTIVE => 0x400,
    SIMPLEX => 0x800,
    LINK0 => 0x1_000,
    LINK1 => 0x2_000,
    LINK2 => 0x4_000,
    MULTICAST => 0x8_000,
  );
  IFF;
}
!! ($*KERNEL.name eq any('dragonflybsd') ?? do {
  my enum IFF (
    UP => 0x1,
    BROADCAST => 0x2,
    DEBUG => 0x4,
    LOOPBACK => 0x8,
    POINTTOPOINT => 0x10,
    SMART => 0x20,
    RUNNING => 0x40,
    NOARP => 0x80,
    PROMISC => 0x100,
    ALLMULTI => 0x200,
    OACTIVE_COMPAT => 0x400,
    OACTIVE => 0x400,
    SIMPLEX => 0x800,
    LINK0 => 0x1_000,
    LINK1 => 0x2_000,
    LINK2 => 0x4_000,
    ALTPHYS => 0x4_000,
    MULTICAST => 0x8_000,
    POLLING_COMPAT => 0x10_000,
    POLLING => 0x10_000,
    PPROMISC => 0x20_000,
    MONITOR => 0x40_000,
    STATICARP => 0x80_000,
    NPOLLING => 0x100_000,
    IDIRECT => 0x200_000,
  );
  IFF;
}
!! ($*DISTRO.is-win() ?? do {
  my enum IFF (
    UP => 0x1,
    BROADCAST => 0x2,
    LOOPBACK => 0x4,
    POINTTOPOINT => 0x8,
    MULTICAST => 0x10,
  );
  IFF;
}
!! ($*KERNEL.name eq 'freebsd' ?? do {
  my enum IFF (
    UP => 0x1,
    BROADCAST => 0x2,
    DEBUG => 0x4,
    LOOPBACK => 0x8,
    POINTTOPOINT => 0x10,
    DRV_RUNNING => 0x40,
    RUNNING => 0x40,
    NOARP => 0x80,
    PROMISC => 0x100,
    ALLMULTI => 0x200,
    OACTIVE => 0x400,
    DRV_OACTIVE => 0x400,
    SIMPLEX => 0x800,
    LINK0 => 0x1_000,
    LINK1 => 0x2_000,
    LINK2 => 0x4_000,
    ALTPHYS => 0x4_000,
    MULTICAST => 0x8_000,
    CANTCONFIG => 0x10_000,
    PPROMISC => 0x20_000,
    MONITOR => 0x40_000,
    STATICARP => 0x80_000,
    DYING => 0x200_000,
    RENAMING => 0x400_000,
    NOGROUP => 0x800_000,
  );
  IFF;
}
!! ($*KERNEL.name eq 'openbsd' ?? do {
  my enum IFF (
    UP => 0x1,
    BROADCAST => 0x2,
    DEBUG => 0x4,
    LOOPBACK => 0x8,
    POINTTOPOINT => 0x10,
    RUNNING => 0x40,
    NOARP => 0x80,
    PROMISC => 0x100,
    ALLMULTI => 0x200,
    OACTIVE => 0x400,
    SIMPLEX => 0x800,
    LINK0 => 0x1_000,
    LINK1 => 0x2_000,
    LINK2 => 0x4_000,
    MULTICAST => 0x8_000,
  );
  IFF;
}
!! do { #macosx
  my enum IFF (
    UP => 0x1,
    BROADCAST => 0x2,
    DEBUG => 0x4,
    LOOPBACK => 0x8,
    POINTTOPOINT => 0x10,
    NOTRAILERS => 0x20,
    RUNNING => 0x40,
    NOARP => 0x80,
    PROMISC => 0x100,
    ALLMULTI => 0x200,
    OACTIVE => 0x400,
    SIMPLEX => 0x800,
    LINK0 => 0x1_000,
    LINK1 => 0x2_000,
    LINK2 => 0x4_000,
    MULTICAST => 0x8_000,
  );
  IFF;
}
)))));
