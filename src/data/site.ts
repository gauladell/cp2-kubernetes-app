import type { ImageMetadata } from "@astrojs/image/dist/vite-plugin-astro-image";
// @ts-ignore
import image from "../assets/social.png";
// @ts-ignore
import pic from "../assets/ascii.png";

export interface Author {
    firstname: string;
    bio: string;
    profilePic: ImageMetadata;
    os?: string;
    shell?: string;
    lastname: string;
    socials: Socials[];
}

export interface Socials {
    name: string;
    link: string;
}

export interface Site {
    lang: string;
    rssTitle: string;
    siteName: string;
    title: string;
    description: string;
    image: ImageMetadata;
    twitterCreator: string;
    author: Author;
}

export const site: Site = {
    lang: "en",
    rssTitle: "Onadrog's blog posts",
    siteName: "gauladell",
    title: "Welcome to my personal website.",
    description:
        "This is my personal Website developed for UNIR DEVOPS.",
    image: image,
    twitterCreator: "",
    author: {
        os: "MacOS",
        profilePic: pic,
        shell: "Zsh",
        bio: "DevOps and Sysadmin trying to master everything I can.",
        firstname: "Gerard",
        lastname: "Auladell",
        socials: [
            {
                name: "github",
                link: "https://github.com/gauladell",
            },
        ],
    },
};
