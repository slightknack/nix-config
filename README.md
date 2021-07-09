# NixOS config files
*To whom it may concern:*

I installed NixOS the other day, and will be uninstalling it shortly. I really love NixOS: it's fast, fairly intuitive, and works great OOTB. And yet...

> The thing about NixOS is: when it works, oh boy, it works - I can rebuild my entire operating system, from source and cryptographically verified, then swap it out, live, without rebooting. That's insane, and a testament to its power! But when NixOS doesn't work, and you've reached a ne'er-before-seen corner, there's no wiggle room. You have to do things *The Right Way*. This makes sense! If NixOS didn't enforce certain constraints, the whole point of a declarative-and-deterministic-package-manager-based operating system would be moot. Although the model is sound in theory, I feel there is not enough support for Nix as a whole yet: 80,000 is a *lot* of packages, but *someone* has to package them all! There's still a lot more work to do, and I'm not sure it's something I want to spend my time doing. NixOS is a great idea, but a hard one to wrap your head around; if you like the idea but still want some wiggle-room, just use plain ol' Nix with whatever OS you're already using. :smile:

I'm not complaining, I really like working in NixOS! I've just run into some issues that I have wasted days on trying to resolve. This is probably because of what I'm using Nix for (developing a large system-level Rust application that expects a 'standard' Unix environment, warts included), it's not a flaw in the language or its tooling.

But because I've run into this issue, I'm doing what I must: tossing my minimal configs into a GitHub repo until NixOS is mature enough to become my daily driver (and I don't doubt it will). 

Thanks for the ride, 'til we meet again!

*Isaac*
