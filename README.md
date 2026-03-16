# scholarly-kit

A KIT dissertation and thesis template for [Typst](https://typst.app), designed to comply with the formatting requirements of [KIT Scientific Publishing (KSP)](https://www.bibliothek.kit.edu/ksp-toolbox.php).

> **Disclaimer:** This is an unofficial community template. It is not affiliated with, endorsed by, or approved by KIT (Karlsruhe Institute of Technology) or KIT Scientific Publishing. The template attempts to follow the [KSP Basic Layout Guidelines](https://www.bibliothek.kit.edu/downloads/KSP/KSP-Basic-Layout-Guidelines.pdf) but compliance is not guaranteed. Always verify your final manuscript with KSP before submission.

> **Please note**: This template is in early development and may contain incomplete features, bugs, or formatting issues.
> You should probably not use it yet for your actual dissertation or thesis until it has reached a more mature state.

## Prerequisites

- Typst 0.14.2 (pinned in `mise.toml`)
- Libertinus fonts installed on your system (see below)

[mise](https://mise.jdx.dev) is recommended for managing the Typst version and running build tasks. All tasks are plain shell scripts in `mise/tasks/` and can be run directly without mise.

## Quick Start

```bash
# Install fonts (once)
mise run install:fonts        # or: bash mise/tasks/install/fonts

# Register as a local Typst package
mise run install              # or: bash mise/tasks/install/_default

# Build all examples, API docs, template, and thumbnail
mise run build                # or run the scripts in mise/tasks/build/ directly
```

### Available tasks

| Task | Description |
|------|-------------|
| `mise run build` | Compile all examples, API docs, template, and thumbnail |
| `mise run build:examples` | Compile example documents only |
| `mise run build:docs` | Compile API reference (`docs/api-reference.pdf`) |
| `mise run build:template` | Compile the Typst Universe template |
| `mise run build:thumbnail` | Compile the template thumbnail |
| `mise run install` | Install as local Typst package (copy) |
| `mise run install:editable` | Install as local Typst package (symlink, editable) |
| `mise run install:fonts` | Install bundled Libertinus fonts to user font directory |
| `mise run test` | Run targeted build tests |

### Editable install

Use `mise run install:editable` during development — changes to the template take effect immediately without reinstalling. Use `mise run install` for a stable copy that persists if the repository is deleted.

In `main.typ`:

```typst
#import "@local/scholarly-kit:0.1.0": dissertation

#show: dissertation.with(
  author-firstname:  "Max",
  author-surname:    "Mustermann",
  title:             [Title of the Dissertation],
  lang:              "de",
  abstract-de:       include "content/abstract-de.typ",
  abstract-en:       include "content/abstract-en.typ",
  bibliography:      bibliography("bib/references.bib", title: none, style: "ieee"),
  appendix: [
    = Appendix Chapter
    ...
  ],
)

#include "content/01-introduction.typ"
```

See `example/dissertation-full.typ` for a complete example with all options, or consult the [API Reference](docs/api-reference.pdf) for full parameter documentation.

## Parameters — `dissertation(...)`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `author-title` | `str \| none` | `"M.Sc."` | Academic title; `none` to omit |
| `author-firstname` | `str` | `"Max"` | |
| `author-surname` | `str` | `"Mustermann"` | |
| `author-male` | `bool` | `true` | Controls gendered German text |
| `place-of-birth` | `str \| none` | `none` | Place of birth ("aus …"); `none` = omit |
| `title` | `content` | | Thesis title |
| `doc-degree` | `str` | `"Doktors der Ingenieurwissenschaften (Dr.-Ing.)"` | |
| `doc-degree-f` | `str` | `"Doktorin der Ingenieurwissenschaften (Dr.-Ing.)"` | |
| `department` | `str` | `"KIT-Fakultät für Maschinenbau"` | |
| `university-genitive` | `str` | `"des Karlsruher Instituts für Technologie (KIT)"` | |
| `lang` | `"de" \| "en"` | `"de"` | Document language |
| `margin-preset` | `"short" \| "medium" \| "long"` | `"short"` | KSP margin profile (see below) |
| `status-approved` | `bool` | `false` | `false` = eingereicht, `true` = angenommen |
| `exam-date` | `str \| none` | `none` | Required when `status-approved = true` |
| `main-advisor` | `str \| none` | `none` | Hauptreferent |
| `main-advisor-male` | `bool` | `true` | |
| `co-advisor` | `str \| none` | `none` | Korreferent |
| `co-advisor-male` | `bool` | `true` | |
| `abstract-en` | `content \| none` | `none` | |
| `abstract-de` | `content \| none` | `none` | |
| `acknowledgements` | `content \| none` | `none` | |
| `cv-name` | `str \| none` | `none` | Show CV page if set |
| `cv-entries` | `array` | `()` | `(year, description)` tuples |
| `binding-correction` | `length` | `0mm` | BCOR added to inside margin (8–10 mm for print) |
| `colored-links` | `bool` | `true` | KIT Blue hyperlinks (screen); `false` = black (print) |
| `draft` | `bool` | `false` | Show "DRAFT" note |
| `draft-info` | `str \| none` | `none` | Version string in watermark (e.g. git SHA) |
| `notation` | `content \| none` | `none` | Symbol/notation list |
| `abbreviations` | `content \| none` | `none` | Abbreviations / acronym list |
| `own-publications` | `content \| none` | `none` | Back-matter publications |
| `own-patents` | `content \| none` | `none` | Back-matter patents |
| `supervised-theses` | `content \| none` | `none` | Back-matter supervised theses |
| `show-lof` | `bool` | `true` | List of figures |
| `show-lot` | `bool` | `true` | List of tables |
| `show-lol` | `bool` | `false` | List of listings |
| `bibliography` | `content \| none` | `none` | Pass `bibliography("refs.bib", title: none, style: "ieee")`; template adds a translated heading |
| `appendix` | `content \| none` | `none` | Appendix chapters; template applies A, A.1, … numbering, placed after back-matter lists |

## Parameters — `thesis(...)`

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `author-firstname` | `str` | `"Max"` | |
| `author-surname` | `str` | `"Mustermann"` | |
| `title` | `content` | | Thesis title |
| `thesis-type` | `str` | `"Masterarbeit"` | e.g. `"Bachelorarbeit"`, `"Diplomarbeit"` |
| `department` | `str` | `"KIT-Fakultät für Maschinenbau"` | |
| `university-genitive` | `str` | `"des Karlsruher Instituts für Technologie (KIT)"` | |
| `examiner` | `str \| none` | `none` | Erstprüfer |
| `supervisor` | `str \| none` | `none` | Betreuer |
| `date-submitted` | `str \| none` | `none` | |
| `lang` | `"de" \| "en"` | `"de"` | |
| `margin-preset` | `"short" \| "medium" \| "long"` | `"short"` | |
| `binding-correction` | `length` | `0mm` | BCOR added to inside margin |
| `colored-links` | `bool` | `true` | KIT Blue links (screen); `false` = black (print) |
| `draft` | `bool` | `false` | Show "DRAFT" note |
| `draft-info` | `str \| none` | `none` | Version string in watermark |
| `abstract-en` | `content \| none` | `none` | |
| `abstract-de` | `content \| none` | `none` | |
| `acknowledgements` | `content \| none` | `none` | |
| `abbreviations` | `content \| none` | `none` | Abbreviations / acronym list |
| `show-lof` | `bool` | `true` | |
| `show-lot` | `bool` | `true` | |
| `show-lol` | `bool` | `false` | |
| `bibliography` | `content \| none` | `none` | Pass `bibliography("refs.bib", title: none, style: "ieee")`; template adds a translated heading |
| `appendix` | `content \| none` | `none` | Appendix chapters; template applies A, A.1, … numbering, placed after back-matter lists |

## Draft Mode

Set `draft: true` to print a "DRAFT" note at the bottom of each page.
You can also pass a `draft-info` string to include additional information, such as the current date or a git commit SHA for version tracking:

```typst
#show: dissertation.with(
  ...
  draft:      true,
  draft-info: sys.inputs.at("git-sha", default: none),
)
```

Compile with the SHA injected:

```bash
typst compile --input git-sha=$(git rev-parse --short HEAD) dissertation-full.typ
```

## Automatic Abbreviation Expansion (Glossarium)

Use the [glossarium](https://typst.app/universe/package/glossarium) package for automatic first-use expansion of abbreviations. Import it directly in your document — **do not** import `gls`/`glspl` from `lib.typ`.

**Important:** `#show: make-glossary` must appear *before* `#show: dissertation.with(...)`. Forgetting this causes silent failure — abbreviations will not expand.

```typst
#import "@local/scholarly-kit:0.1.0": dissertation
#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls, glspl

#let abbrevs = (
  (key: "ml",  short: "ML",  long: "Machine Learning"),
  (key: "cnn", short: "CNN", long: "Convolutional Neural Network"),
)

// Must come before #show: dissertation.with(...)
#show: make-glossary
#register-glossary(abbrevs)

#show: dissertation.with(
  ...
  // Pass print-glossary() as the abbreviations content.
  // The template adds the translated section heading automatically.
  abbreviations: print-glossary(abbrevs),
)

// #gls("ml") expands to "Machine Learning (ML)" on first use, "ML" thereafter.
```

## Multi-Bibliography (Alexandria)

Use the [alexandria](https://typst.app/universe/package/alexandria) package to have separate bibliography sections for own publications, supervised theses, and patents alongside the main bibliography. Import it directly in your document.

```typst
#import "@local/scholarly-kit:0.1.0": dissertation
#import "@preview/alexandria:0.2.2": alexandria, bibliographyx

// Must come before #show: dissertation.with(...)
#show: alexandria(prefix: "p:", read: path => read(path))

#show: dissertation.with(
  ...
  own-publications: bibliographyx(
    "bib/own-publications.bib",
    title: none, style: "ieee", full: true,
  ),
  bibliography: bibliography("bib/references.bib", title: none, style: "ieee"),
)
```

In-text citations to own-publications use `@p:key` syntax.

## Draft Annotations (Drafting)

Use the [drafting](https://typst.app/universe/package/drafting) package to add margin notes during writing. Define `is-draft` as a variable and use it for both the watermark and the note visibility so they are toggled together.

```typst
#import "@local/scholarly-kit:0.1.0": dissertation
#import "@preview/drafting:0.2.2": set-margin-note-defaults, margin-note

#let is-draft = true
#set-margin-note-defaults(hidden: not is-draft)

#show: dissertation.with(
  ...
  draft: is-draft,
)

// In your text:
#margin-note[Revisit this paragraph.]
```

Set `is-draft = false` before final compilation to hide all margin notes and remove the watermark.

## Margin Presets

Choose based on the total page count of the finished dissertation (KSP requirement):

| Preset | Page count | Inner | Outer |
|--------|-----------|-------|-------|
| `"short"` | < 200 | 20 mm | 15 mm |
| `"medium"` | 200–399 | 23 mm | 15 mm |
| `"long"` | ≥ 400 | 25 mm | 15 mm |

## License

Template code: MIT-0 (no attribution required). Bundled fonts (`fonts/`): SIL OFL 1.1.

---

> **Full transparency**: This template has been implemented with AI assistance (Claude Code by Anthropic).
> The basis for the template are the [KSP guidelines](https://www.bibliothek.kit.edu/downloads/KSP/KSP-Basic-Layout-Guidelines.pdf), the [official KSP LaTeX template](https://gitlab.kit.edu/kit/ksp/ksp-vorlage-a5-de-diss), as well as [this great LaTeX template](https://gitlab.cc-asp.fraunhofer.de/kit-ksp/dissertation-template).
