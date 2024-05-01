type text = { type: 'text', content: string }

type format =
    | { type: 'bold', content: text[] }
    | { type: 'italic', content: text[] }
    | { type: 'underline', content: text[] }
    | { type: 'strike', content: text[] }
    | { type: 'code', content: text[] }
    | { type: 'quote', content: text[] }

type a = {
    href: string,
    content: text[],
}

type figure = {
    src: string,
    alt?: string,
    caption?: string,
    link?: {
        href: a['href'],
    },
}

type icon = {
    name: string,
}

type list = {
    ordered: boolean,
    items: string[],
}

type table = {
    headers: string[],
    rows: string[][],
}

type parser = {
    parse: (input: string) => element[],
}

type element =
    | { type: 'text', content: text[] }
    | { type: 'format', content: format[], format: format['type'] }
    | { type: 'h', level: number, content: string }
    | { type: 'a', content: a['content'], href: a['href'] }
    | { type: 'img', src: string, alt?: string }
    | { type: 'figure', src: figure['src'], alt?: figure['alt'], caption?: figure['caption'], link?: figure['link'] }
    | { type: 'icon', name: icon['name'] }
    | { type: 'list', ordered: list['ordered'], items: list['items'] }
    | { type: 'table', headers: table['headers'], rows: table['rows'] }