type text = { type: 'text', content: string }

type format =
    | { type: 'bold', content: text[] }
    | { type: 'italic', content: text[] }
    | { type: 'underline', content: text[] }
    | { type: 'strike', content: text[] }
    | { type: 'code', content: text[] }
    | { type: 'quote', content: text[] }
    | { type: 'icon', content: string; size: number }

type a = {
    href: string,
    content: text[],
}

type figure = {
    src: string,
    alt?: string,
    caption?: string,
    link?: {
        content: a[],
    },
}

type element =
    | { type: 'text', content: text[] }
    | { type: 'format', content: format[], format: format['type'] }
    | { type: 'h', level: number, content: string }
    | { type: 'a', content: a['content'], href: a['href'] }
    | { type: 'img', src: string, alt?: string }