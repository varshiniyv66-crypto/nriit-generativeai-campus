"use client";

import React, { useState, useRef, useEffect } from "react";
import {
    MessageCircle,
    X,
    Send,
    Bot,
    User,
    Sparkles,
    Loader2,
    BrainCircuit,
    Mic,
    MicOff,
    Volume2,
    VolumeX
} from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";

interface Message {
    role: "user" | "assistant";
    content: string;
}

// Type definition for Web Speech API
declare global {
    interface Window {
        SpeechRecognition: any;
        webkitSpeechRecognition: any;
    }
}

export function VisionaryAssistant() {
    const [isOpen, setIsOpen] = useState(false);
    const [messages, setMessages] = useState<Message[]>([
        {
            role: "assistant",
            content: "Welcome to NRIIT Visionary Support. I am your AI Academic Counselor. You can speak to me or type your questions."
        }
    ]);
    const [input, setInput] = useState("");
    const [isLoading, setIsLoading] = useState(false);
    const scrollRef = useRef<HTMLDivElement>(null);

    // Voice State
    const [isListening, setIsListening] = useState(false);
    const [isSpeaking, setIsSpeaking] = useState(false);
    const [voiceEnabled, setVoiceEnabled] = useState(true);
    const [voiceSupported, setVoiceSupported] = useState(false);
    const recognitionRef = useRef<any>(null);

    useEffect(() => {
        if (scrollRef.current) {
            scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
        }
    }, [messages]);

    // Initialize Speech Recognition
    useEffect(() => {
        if (typeof window !== 'undefined' && ('SpeechRecognition' in window || 'webkitSpeechRecognition' in window)) {
            setVoiceSupported(true);
            const SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
            recognitionRef.current = new SpeechRecognition();
            recognitionRef.current.continuous = false;
            recognitionRef.current.interimResults = false;
            recognitionRef.current.lang = 'en-IN';

            recognitionRef.current.onstart = () => setIsListening(true);
            recognitionRef.current.onend = () => setIsListening(false);

            recognitionRef.current.onresult = (event: any) => {
                const transcript = event.results[0][0].transcript;
                setInput(transcript);
                // Auto-send after voice input
                handleSend(transcript);
            };

            recognitionRef.current.onerror = (event: any) => {
                console.error("Speech recognition error", event.error);
                setIsListening(false);
            };
        }
    }, []);

    // Handle Text-to-Speech
    const speak = (text: string) => {
        if (!voiceEnabled || typeof window === 'undefined' || !('speechSynthesis' in window)) return;

        // Cancel any ongoing speech
        window.speechSynthesis.cancel();

        // Remove markdown formatting for speech
        const cleanText = text
            .replace(/\*\*/g, '')
            .replace(/\*/g, '')
            .replace(/—/g, '-')
            .replace(/\n/g, '. ')
            .replace(/[#•]/g, '');

        const utterance = new SpeechSynthesisUtterance(cleanText);
        utterance.onstart = () => setIsSpeaking(true);
        utterance.onend = () => setIsSpeaking(false);
        utterance.onerror = () => setIsSpeaking(false);
        utterance.rate = 1.0;
        utterance.pitch = 1.0;

        // Select a pleasant voice if available
        const voices = window.speechSynthesis.getVoices();
        const preferredVoice = voices.find(v =>
            v.name.includes('Google') ||
            v.name.includes('Microsoft') ||
            v.lang.startsWith('en')
        ) || voices[0];
        if (preferredVoice) utterance.voice = preferredVoice;

        window.speechSynthesis.speak(utterance);
    };

    const toggleListening = () => {
        if (!voiceSupported) {
            alert("Voice input is not supported in this browser. Please use Chrome or Edge.");
            return;
        }

        if (isListening) {
            recognitionRef.current?.stop();
        } else {
            // Stop speaking if bot is talking when user wants to talk
            window.speechSynthesis?.cancel();
            setIsSpeaking(false);
            try {
                recognitionRef.current?.start();
            } catch (e) {
                console.error("Error starting recognition:", e);
            }
        }
    };

    const handleSend = async (overrideInput?: string) => {
        const textToSend = overrideInput || input;
        if (!textToSend.trim() || isLoading) return;

        const userMsg = { role: "user" as const, content: textToSend };
        setMessages(prev => [...prev, userMsg]);
        setInput("");
        setIsLoading(true);

        try {
            const response = await fetch("/api/chat", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ messages: [...messages, userMsg] }),
            });

            const data = await response.json();

            if (!response.ok) {
                const errorMsg = `Error: ${data.content || "Connection failed. Please check your AI API keys in .env.local"}`;
                setMessages(prev => [...prev, { role: "assistant", content: errorMsg }]);
                return;
            }

            // Show provider info if available
            const providerNote = data.provider ? `\n\n*— Powered by ${data.provider}*` : "";
            const fullResponse = data.content + providerNote;
            setMessages(prev => [...prev, { role: "assistant", content: fullResponse }]);

            // Auto-speak response if voice is enabled
            if (voiceEnabled) {
                speak(data.content);
            }
        } catch (error) {
            setMessages(prev => [...prev, {
                role: "assistant",
                content: "Error: I'm currently disconnected from my neural core. Please try again."
            }]);
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <div className="fixed bottom-6 right-6 z-[100]">
            <AnimatePresence>
                {isOpen && (
                    <motion.div
                        initial={{ opacity: 0, scale: 0.9, y: 20 }}
                        animate={{ opacity: 1, scale: 1, y: 0 }}
                        exit={{ opacity: 0, scale: 0.9, y: 20 }}
                        className="mb-4 w-[380px] md:w-[450px] h-[600px] bg-slate-900/90 backdrop-blur-2xl rounded-[2.5rem] border border-white/10 shadow-[0_32px_64px_-12px_rgba(0,0,0,0.5)] flex flex-col overflow-hidden"
                    >
                        {/* Header */}
                        <div className="p-6 bg-gradient-to-r from-blue-600 to-indigo-700 flex items-center justify-between">
                            <div className="flex items-center gap-3">
                                <div className={`p-2 bg-white/20 rounded-xl transition-all ${isSpeaking ? 'scale-110 ring-2 ring-white/50' : ''}`}>
                                    <BrainCircuit className="w-6 h-6 text-white" />
                                </div>
                                <div>
                                    <h3 className="text-white font-black text-lg leading-none">NRIIT Assistant</h3>
                                    <div className="flex items-center gap-1.5 mt-1">
                                        <span className={`w-2 h-2 rounded-full ${isListening ? 'bg-red-500 animate-ping' : isSpeaking ? 'bg-yellow-400 animate-pulse' : 'bg-emerald-400 animate-pulse'}`} />
                                        <span className="text-blue-100 text-[10px] font-black uppercase tracking-widest">
                                            {isListening ? 'Listening...' : isSpeaking ? 'Speaking...' : 'Online'}
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div className="flex items-center gap-2">
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onClick={() => {
                                        setVoiceEnabled(!voiceEnabled);
                                        window.speechSynthesis?.cancel();
                                        setIsSpeaking(false);
                                    }}
                                    className="text-white hover:bg-white/10 rounded-full"
                                    title={voiceEnabled ? "Mute Voice" : "Enable Voice"}
                                >
                                    {voiceEnabled ? <Volume2 className="w-5 h-5" /> : <VolumeX className="w-5 h-5" />}
                                </Button>
                                <Button
                                    variant="ghost"
                                    size="icon"
                                    onClick={() => {
                                        setIsOpen(false);
                                        window.speechSynthesis?.cancel();
                                        setIsSpeaking(false);
                                        setIsListening(false);
                                    }}
                                    className="text-white hover:bg-white/10 rounded-full"
                                >
                                    <X className="w-5 h-5" />
                                </Button>
                            </div>
                        </div>

                        {/* Chat Area */}
                        <div className="flex-1 overflow-y-auto p-6 space-y-4 scroll-smooth" ref={scrollRef}>
                            <div className="text-center text-xs text-slate-500 my-4">Start Conversation</div>
                            {messages.map((m, i) => (
                                <motion.div
                                    initial={{ opacity: 0, x: m.role === "user" ? 10 : -10 }}
                                    animate={{ opacity: 1, x: 0 }}
                                    key={i}
                                    className={`flex ${m.role === "user" ? "justify-end" : "justify-start"}`}
                                >
                                    <div className={`max-w-[85%] flex gap-3 ${m.role === "user" ? "flex-row-reverse" : "flex-row"}`}>
                                        <div className={`w-8 h-8 rounded-lg flex items-center justify-center flex-shrink-0 ${m.role === "assistant" ? "bg-blue-600 text-white" : "bg-slate-700 text-slate-300"
                                            }`}>
                                            {m.role === "assistant" ? <Bot className="w-4 h-4" /> : <User className="w-4 h-4" />}
                                        </div>
                                        <div className={`p-4 rounded-2xl text-sm leading-relaxed ${m.role === "assistant"
                                            ? "bg-slate-800 text-slate-100 border border-white/5"
                                            : "bg-blue-600 text-white"
                                            }`}>
                                            {m.content}
                                        </div>
                                    </div>
                                </motion.div>
                            ))}
                            {isLoading && (
                                <div className="flex justify-start">
                                    <div className="flex gap-3 items-center bg-slate-800/50 p-4 rounded-2xl border border-white/5">
                                        <Loader2 className="w-4 h-4 animate-spin text-blue-400" />
                                        <span className="text-xs text-slate-400 font-bold uppercase tracking-widest">Synthesizing Response...</span>
                                    </div>
                                </div>
                            )}
                        </div>

                        {/* Voice Input Indicator */}
                        <AnimatePresence>
                            {isListening && (
                                <motion.div
                                    initial={{ opacity: 0, y: 10 }}
                                    animate={{ opacity: 1, y: 0 }}
                                    exit={{ opacity: 0, y: 10 }}
                                    className="px-6 py-2 flex justify-center"
                                >
                                    <div className="bg-red-500 text-white text-xs font-bold px-4 py-2 rounded-full shadow-lg animate-pulse flex items-center gap-2">
                                        <Mic className="w-4 h-4" />
                                        Listening... Speak now
                                    </div>
                                </motion.div>
                            )}
                        </AnimatePresence>

                        {/* Input Area */}
                        <div className="p-4 bg-slate-900/50 border-t border-white/10">
                            <form
                                onSubmit={(e) => { e.preventDefault(); handleSend(); }}
                                className="flex items-center gap-2"
                            >
                                {/* Mic Button */}
                                <Button
                                    type="button"
                                    onClick={toggleListening}
                                    className={`h-12 w-12 rounded-xl transition-all ${isListening
                                        ? 'bg-red-500 hover:bg-red-600 text-white shadow-lg shadow-red-500/30 scale-110'
                                        : 'bg-slate-800 hover:bg-slate-700 text-slate-400'
                                        }`}
                                    title="Voice Input"
                                >
                                    {isListening ? <MicOff className="w-5 h-5" /> : <Mic className="w-5 h-5" />}
                                </Button>

                                {/* Text Input */}
                                <div className="flex-1 relative">
                                    <Input
                                        value={input}
                                        onChange={(e) => setInput(e.target.value)}
                                        placeholder={isListening ? "Listening..." : "Type or speak..."}
                                        className="pr-12 bg-slate-800 border-white/10 text-white h-12 rounded-xl focus:ring-blue-600"
                                        disabled={isListening}
                                    />
                                </div>

                                {/* Send Button */}
                                <Button
                                    type="submit"
                                    size="icon"
                                    disabled={isLoading || !input.trim()}
                                    className="h-12 w-12 bg-blue-600 hover:bg-blue-700 rounded-xl transition-all"
                                >
                                    <Send className="w-5 h-5" />
                                </Button>
                            </form>
                            <p className="text-[9px] text-slate-500 text-center mt-3 uppercase font-black tracking-widest">
                                Powered by OpenAI & Gemini • Voice Enabled
                            </p>
                        </div>
                    </motion.div>
                )}
            </AnimatePresence>

            {/* Toggle Button */}
            <motion.div
                whileHover={{ scale: 1.1 }}
                whileTap={{ scale: 0.9 }}
            >
                <Button
                    onClick={() => setIsOpen(!isOpen)}
                    className="h-16 w-16 rounded-full bg-gradient-to-br from-blue-600 to-indigo-700 shadow-[0_20px_40px_rgba(37,99,235,0.4)] border-2 border-white/20 p-0 flex items-center justify-center group"
                >
                    {isOpen ? (
                        <X className="w-6 h-6 text-white" />
                    ) : (
                        <div className="relative">
                            <MessageCircle className="w-8 h-8 text-white group-hover:rotate-12 transition-transform" />
                            <div className="absolute -top-1 -right-1 h-4 w-4 bg-emerald-500 rounded-full border-2 border-slate-900" />
                        </div>
                    )}
                </Button>
                {!isOpen && (
                    <div className="absolute -top-12 right-0 bg-white px-4 py-2 rounded-xl shadow-xl border border-slate-100 whitespace-nowrap animate-bounce-slow">
                        <span className="text-[10px] font-black text-slate-900 flex items-center gap-2">
                            <Sparkles className="w-3 h-3 text-amber-500" />
                            Voice Assistant Ready
                        </span>
                        <div className="absolute bottom-[-6px] right-6 w-3 h-3 bg-white rotate-45 border-r border-b border-slate-100" />
                    </div>
                )}
            </motion.div>
        </div>
    );
}
