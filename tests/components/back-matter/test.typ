// Compile-only: print-lof, print-lot, print-lol — verifies the flex-caption
// state management compiles correctly when list functions are called directly.
#import "/lib.typ": (
    flex-caption, print-lof, print-lol, print-lot, setup-content, setup-page,
)

#show: setup-page.with(lang: "en", margin-preset: "short")
#show: setup-content

= Chapter One

#figure(
    rect(width: 3cm, height: 2cm),
    caption: flex-caption(short: [Short caption], long: [Long caption for the figure
        body.]),
)

#figure(
    table(
        columns: 2,
        [A], [B],
    ),
    caption: [A table.],
    kind: table,
)

#print-lof(lang: "en")
#print-lot(lang: "en")
#print-lol(lang: "en")
